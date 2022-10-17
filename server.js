import bcrypt from 'bcrypt'
import cors from 'cors'
import dotenv from 'dotenv'
import express, { query } from 'express'
import joi from 'joi'
import { nanoid } from 'nanoid'
import pg from 'pg'
import { v4 as uuid } from 'uuid'

dotenv.config()

const server = express()
server.use(cors())
server.use(express.json())

const { Pool } = pg
const connection = new Pool({
  connectionString: process.env.DATABASE_URL
})

//schemas

const signupSchema = joi.object({
  name: joi.string().required(),
  email: joi.string().email().required(),
  password: joi.string().required(),
  confirmPassword: joi.string().required()
})

const signinSchema = joi.object({
  email: joi.string().email().required(),
  password: joi.string().required()
})

// POST /signup

server.post('/signup', async (req, res) => {
  const { name, email, password, confirmPassword } = req.body

  let encriptedPassoword = bcrypt.hashSync(password, 10)

  const valid = signupSchema.validate({
    name,
    email,
    password,
    confirmPassword
  })

  if (password != confirmPassword) {
    return res.send(422)
  }

  if (valid.error) {
    return res.send(422)
  }

  try {
    const emailExist = await connection.query(
      'SELECT * FROM users WHERE email = $1',
      [email]
    )

    if (emailExist.rows.length > 0) {
      return res.send(409)
    }

    await connection.query(
      'INSERT INTO users ("name", "email", "password") VALUES ($1,$2,$3);',
      [name, email, encriptedPassoword]
    )

    return res.send(200)
  } catch {
    return res.send(500)
  }
})

// POST /signin

server.post('/signin', async (req, res) => {
  const { email, password } = req.body

  const valid = signinSchema.validate({
    email,
    password
  })

  if (valid.error) {
    return res.send(422)
  }

  try {
    const user = await connection.query(
      'SELECT * FROM users WHERE email = $1',
      [email]
    )

    if (user.rows.length === 0) {
      return res.send(401)
    }

    let correctPassword = bcrypt.compareSync(password, user.rows[0].password)

    if (!correctPassword) {
      return res.send(401)
    }

    const token = uuid()

    await connection.query(
      `INSERT INTO sessions ("userId", token) VALUES ($1, $2);`,
      [user.rows[0].id, token]
    )

    return res.send(200, { token: token })
  } catch {
    return res.send(500)
  }
})

// POST /urls/shorten

server.post('/urls/shorten', async (req, res) => {
  const link = req.body

  const token = req.headers.authorization?.replace('Bearer ', '')

  try {
    new URL(link.url)
  } catch {
    return res.send(422)
  }

  try {
    const session = await connection.query(
      'SELECT users.id, users.name, sessions.token FROM sessions JOIN users ON sessions."userId" = users.id WHERE sessions.token = $1',
      [token]
    )

    if (session.rows.length === 0) {
      return res.sendStatus(401)
    }

    const shortUrl = nanoid(10)

    await connection.query(
      'INSERT INTO urls ("userId", url, "shortUrl") VALUES ($1, $2, $3);',
      [session.rows[0].id, link.url, shortUrl]
    )

    return res.send(200, {})
  } catch {
    return res.sendStatus(500)
  }
})

// GET /urls/:id

server.get('/urls/:id', async (req, res) => {
  const urlId = req.params

  try {
    const url = await connection.query(
      'SELECT id, "shortUrl", url FROM urls WHERE id = $1;',
      [urlId.id]
    )

    if (url.rows.length === 0) {
      return res.send(404)
    }
    return res.send(200, url.rows[0])
  } catch {
    return res.send(500)
  }
})

// GET /urls/open/:shortUrl

server.get('/urls/open/:shortUrl', async (req, res) => {
  const parms = req.params

  try {
    const redirect = await connection.query(
      'SELECT * FROM urls WHERE "shortUrl" = $1',
      [parms.shortUrl]
    )

    if (redirect.rows.length === 0) {
      return res.send(404)
    }

    const access = await connection.query(
      'INSERT INTO accesses ("urlId","userId") VALUES ($1,$2);',
      [redirect.rows[0].id, redirect.rows[0].userId]
    )

    console.log(redirect.rows)

    return res.redirect(redirect.rows[0].url)
  } catch {
    return res.send(500)
  }
})

// DELETE /urls/:id

server.delete('/urls/:id', async (req, res) => {
  const urlId = req.params

  const token = req.headers.authorization?.replace('Bearer ', '')

  try {
    const session = await connection.query(
      'SELECT users.id, users.name, sessions.token FROM sessions JOIN users ON sessions."userId" = users.id WHERE sessions.token = $1',
      [token]
    )

    if (session.rows.length === 0) {
      return res.sendStatus(401)
    }

    const urlExist = await connection.query(
      'SELECT * FROM urls WHERE id = $1',
      [urlId.id]
    )

    if (urlExist.rows.length === 0) {
      return res.sendStatus(404)
    }

    const userUrl = await connection.query(
      'SELECT * FROM urls WHERE id = $1 AND "userId" = $2',
      [urlId.id, session.rows[0].id]
    )

    if (userUrl.rows.length === 0) {
      return res.sendStatus(401)
    }

    await connection.query('DELETE FROM urls WHERE id = $1;', [urlId.id])

    return res.send(204)
  } catch {
    return res.send(500)
  }
})

// GET /users/me

server.get('/users/me', async (req, res) => {
  const token = req.headers.authorization?.replace('Bearer ', '')

  try {
    const session = await connection.query(
      'SELECT users.id, users.name, sessions.token FROM sessions JOIN users ON sessions."userId" = users.id WHERE sessions.token = $1',
      [token]
    )

    if (session.rows.length === 0) {
      return res.sendStatus(401)
    }

    const userExist = await connection.query(
      'SELECT * FROM users WHERE users.id = $1',
      [session.rows[0].id]
    )

    if (userExist.rows.length === 0) {
      return res.sendStatus(404)
    }

    const userInfo = await connection.query(
      'SELECT u.id, u.name, COUNT(accesses.id) AS "visitCount" FROM accesses JOIN users u ON u.id = accesses."userId" WHERE u.id = $1 GROUP BY u.id;',
      [session.rows[0].id]
    )

    const urlsInfo = await connection.query(
      'SELECT u.id, u."shortUrl", u.url, COUNT(accesses.id) AS "visitCount" FROM accesses JOIN urls u ON u.id = accesses."urlId" WHERE u."userId" = $1 GROUP BY u.id',
      [session.rows[0].id]
    )

    const allInfo = {
      id: userInfo.rows[0].id,
      name: userInfo.rows[0].name,
      visitCount: userInfo.rows[0].visitCount,
      shortenedUrls: urlsInfo.rows
    }

    return res.send(200, allInfo)
  } catch {
    return res.send(500)
  }
})

// GET /ranking

server.get('/ranking', async (req, res) => {
  try {
    await connection.query(
      'SElECT users.id, users.name, COUNT(urls."userId") AS "linksCount", COUNT(accesses.id) AS "visitCount" FROM accesses JOIN urls ON accesses."urlId" = urls.id JOIN users ON accesses."userId" = users.id GROUP BY users.id , users.name ORDER BY "visitCount" DESC LIMIT 10;'
    )
  } catch {
    return res.send(500)
  }
})

server.listen(process.env.PORT, () => {
  console.log(`listen on port ${process.env.PORT}`)
})
