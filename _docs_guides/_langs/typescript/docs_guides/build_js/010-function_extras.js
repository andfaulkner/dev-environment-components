console.log('----------------------------------------------------------------------------------');
//#################################
//#          REST PARAMS          #
//#################################
console.log('***************** REST PARAMS *****************');
const buildName = (firstName, ...restOfName) => firstName + restOfName.join(' ');
function showStats(stats) {
    console.log(stats);
}
showStats({ matchesWon: 10, matchesLost: 20, yearsCompeting: 43 });
// class BullCrawler {
//   public fightsWon: number = 0;
//   public fightsLost: number = 0;
//   public yearsFighting: number = 0;
//   constructor(public name: string, public stats: AthleteStats) {
//     { fightsWon, fightsLost, yearsFighting } = { stats };
//   }
// }
// let bullCrawler = {
//   name: buildName('Rodruigo', 'Alejandro', 'Gonzales', 'Garcia', 'Iglacias', 'De la Vega', 'Marquez'),
//   yearsFighting: 10,
//   fightsWon: 342,
//   fightsLost: 231
// };
