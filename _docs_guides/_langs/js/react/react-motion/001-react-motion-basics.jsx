//
// import the library before doing anything else...obviously:
//    npm install react-motion --save
//

// <Motion>
// *   simplest available component in react-motion
// *   lets us transition a value from one value to another.
// *   transitions from value in 'defaultStyle' to the value in 'style'.
//     *   It then applies that value to the children of the Spring component
//     *   Child is expected to be a cb function that takes in the interpolated values

/******************************************************************/
// Simplest example of <Motion> usage:

<Motion defaultStyle={{x: 0}} style={{x: spring(360)}}> 
  {interpolatedStyle => {
    console.log('interpolatedStyle', interpolatedStyle);
    return (<div style={interpolatedStyle}>{interpolatedStyle.x}</div>);
  }}
</Motion>


/******************************************************************/
//  In context, the simplest use of <Motion> would look like this:

import React from 'react';

class APP extends React.Container {

render() {
  <div>
    <Motion defaultStyle={{x: 0}} style={{x: spring(360)}}> 
      {interpolatedStyle => {
        console.log('interpolatedStyle', interpolatedStyle);
        return (<div style={interpolatedStyle}>{interpolatedStyle.x}</div>);
      }}
    </Motion>
  </div>
}


/******************************************************************/
// A more complex example using <Motion>
//

import React from 'react';

// Value of 1 degree in radians
const DEG_TO_RAD = 0.0174533;

// Since JS Math. functions accept value of angle in radians and we've been working in degrees
// we will need to covert degrees to radians first.
function toRadians(degrees) {
  return degrees * DEG_TO_RAD;
}

class APP extends React.Container {

  static constants = {
    BUTTON_DIAM: 50,
    FLY_OUT_RADIUS: 120,
    SEPARATION_ANGLE: 40,
    FAN_ANGLE: 0,
    BASE_ANGLE: ((180 - this.const.FAN_ANGLE) / 2), // degrees

    // Hard coded position values of the mainButton
    M_X: 490,
    M_Y: 450
  }

  finalDeltaPositions = (index) => {
    let angle = this.const.BASE_ANGLE + (index * this.const.SEPARATION_ANGLE);
    return {
      deltaX: (this.const.FLY_OUT_RADIUS * Math.cos(toRadians(angle))) -
              (this.const.BUTTON_DIAM / 2),
      deltaY: (this.const.FLY_OUT_RADIUS * Math.sin(toRadians(angle))) +
              (this.const.BUTTON_DIAM / 2)
    };
  };

  initialButtonStyles() {
    return {
      width: this.const.BUTTON_DIAM,
      height: this.const.BUTTON_DIAM,
      top: this.const.M_Y - (this.const.BUTTON_DIAM / 2),
      left: this.const.M_X - (this.const.BUTTON_DIAM / 2)
    };
  }

  finalButtonStyles(childIndex) {
    let {deltaX, deltaY} = this.finalDeltaPositions(childIndex);
    return {
      width: this.const.BUTTON_DIAM,
      height: this.const.BUTTON_DIAM,
      left: this.const.M_X + deltaX,
      top: this.const.M_Y - deltaY
    };
  }

  render() {
    let {isOpen} = this.state;
    let style = (isOpen) ? this.initialButtonStyles() : this.finalButtonStyles();
    return (
      <div>
        <Motion style={style} key={index}>
          {({width, height, top, left}) => 
            <div
              className="child-button"
              style={{
                width: width,
                height: height,
                top: top,
                left: left
              }}/>
          }
        </Motion>
      </div>
    );
  }
}
