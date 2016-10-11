
// For example, this works:
const gameLoopSansTimer = {
  count: 0,
  start() {
    console.log('loop is running!');
    this.render();
  },
  render() {
    console.log('rendering -> ');
    this.processInput();
  },
  processInput() {
    console.log('processing input -> ');
    this.update();
  },
  update() {
    console.log('Updating!');
    if (this.count++ < 5) {
      this.render();
    }
  }
};

gameLoopSansTimer.start();
// => outputs "loop is running!" once, then  "rendering ->" "processing input ->" "Updating!" 5X

// Notice that the "this" always references the current object literal. *dances*