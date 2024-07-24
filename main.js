const express = require('express')
const app = express()
const port = process.env.PORT || 8000

app.get('/', (req, res) => {
   return res.json({ message: 'Hey I am a Node.js app in a container!' })
})

app.listen(port, () => {
   console.log(`Example app listening at http://localhost:${port}`)
})