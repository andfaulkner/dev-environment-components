console.log('----------------------------------------------------------------------------------');
//#################################
//#          REST PARAMS          #
//#################################
console.log('***************** REST PARAMS *****************');

const buildName = (firstName: string, ...restOfName: string[]) => firstName + restOfName.join(' ');


interface AthleteStats {
  matchesWon:    number;
  matchesLost:   number;
  yearsCompeting: number;
}

function showStats(stats: AthleteStats) {
  console.log(stats);
}

showStats({ matchesWon: 10, matchesLost: 20, yearsCompeting: 43 });

// class BullFighter {
//   public fightsWon: number = 0;
//   public fightsLost: number = 0;
//   public yearsFighting: number = 0;

//   constructor(public name: string, public stats: AthleteStats) {
//     { fightsWon, fightsLost, yearsFighting } = { stats };
//   }
// }

// let bullFighter = {
//   name: buildName('Rodruigo', 'Alejandro', 'Gonzales', 'Garcia', 'Iglacias', 'De la Vega', 'Marquez'),
//   yearsFighting: 10,
//   fightsWon: 342,
//   fightsLost: 231
// };
