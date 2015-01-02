Post = require '../models/posts'

module.exports =
  createPost: (req, res, next) ->
    post = new Post
      userId: req.user._id
      content: req.body.content
    post.save (err, post) ->
      if err? then return next err
      return res.send post

  getPosts: (req, res, next) ->
    Post.find userId: req.user._id, (err, posts) ->
      if err? then return next err
      return res.send posts

        
  
