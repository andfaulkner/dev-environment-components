/// <reference path="../../typings/react-menu-bar/react-menu-bar.d.ts" />
/// <reference path="../../typings/react/react.d.ts" />

import { MenuBar, MenuItem, Menu, Separator } from 'react-menu-bar';
import * as React from 'react';

interface HeaderProps {  }
interface HeaderState {  }


export class Header extends React.Component<HeaderProps, HeaderState> {

  onSelect(command) {
    console.log('Selected: %s', command);
  }

  render() {
    return (
      <MenuBar onSelect={this.onSelect}>
        <MenuItem label="File">
          <Menu>
            <MenuItem command="new-window">New Window</MenuItem>
            <MenuItem command="new-file">New File</MenuItem>
          </Menu>
        </MenuItem>
      </MenuBar>
    );
  }
};


// export class Header extends React.Component<HeaderProps, HeaderState> {

//   onSelect = (command) => {
//     console.log('Selected: %s', command);
//   }

//   render() {
//     return (
//       <MenuBar onSelect={this.onSelect}>
//         <MenuItem label="File">
//           <Menu>
//             <MenuItem command="new-window">New Window</MenuItem>
//             <MenuItem command="new-file">New File</MenuItem>
//           </Menu>
//         </MenuItem>

//         <MenuItem label="Edit">
//           <Menu>
//             <MenuItem command="undo">Undo</MenuItem>
//             <MenuItem command="redo">Redo</MenuItem>
//             <Separator />
//             <MenuItem label="Find">
//               <Menu>
//                 <MenuItem command="find">Find…</MenuItem>
//                 <MenuItem command="find-next">Find Next</MenuItem>
//                 <MenuItem command="find-previous">Find Previous</MenuItem>
//                 <MenuItem command="use-selection-for-find">Use Selection For Find</MenuItem>
//               </Menu>
//             </MenuItem>
//           </Menu>
//         </MenuItem>

//         <MenuItem label="Help">
//           <Menu>
//             <MenuItem command="terms-of-use">Terms of Use</MenuItem>
//             <MenuItem command="documentation">Documentation</MenuItem>
//             <Separator />
//             <MenuItem command="release-notes">Release Notes</MenuItem>
//           </Menu>
//         </MenuItem>
//       </MenuBar>
//     );
//   }
// };
