mongoose = require 'mongoose'


Post = new mongoose.Schema
  userId: mongoose.Schema.ObjectId

  content: String
  location: String
  createAt:
    type: Date
    default: Date.now
  weather: String
  weatherIcon: String
  

module.exports = mongoose.model 'Post', Post
