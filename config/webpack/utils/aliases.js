const path = require('path')

const resolve_relative = function (dir) {
  return path.join(__dirname, '../../../app/javascript', dir)
}

module.exports = {
  resolve: {
    alias: {
      'images': resolve_relative('assets/images')
    }
  }
}
