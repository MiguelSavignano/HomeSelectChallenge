function Point (x, y) {
  var self = this;
  this.x = x;
  this.y = y;
  this.plus = function(point) {
    return new Point(self.x + point.x, self.y + point.y)
  }
}