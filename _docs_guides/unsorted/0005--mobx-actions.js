/**************************************************************************************************
*
*      MobX - actions
*
*/

// Action example 1

export class ContactStore {
    @observable contacts = [];
    @observable pendingRequestCount = 0;

    @computed get isLoading() {
        return this.pendingRequestCount > 0;
    }

    // modifies contacts and pendingRequestCount
    // Call from the outside by calling someContactStoreInstance.createRandomContact()
    @action createRandomContact() {
        this.pendingRequestCount++;
        superagent.get('https://randomuser.me/api/').end(
            action("createRandomContact-callback", (error, results) => {
                const contact = new Contact(results[0])
                this.contacts.push(contact);
                this.pendingRequestCount--;
            })
        );
    }
}

// **** Transactions (multiple action dispatch) ****
//   Transactions let you dispatch multiple actions one after another, but
//   only modify the store when all are complete.
//   
// Transactions example 1
import {observable, transaction, autorun} from "mobx";

const numbers = observable([]);

autorun(() => console.log(numbers.length, "numbers!"));   // => '0 numbers!'

// Transactions are fully synchronous and can be nested. The transaction only
// returns when the outermost action completes
transaction(() => {
    transaction(() => {
        numbers.push(1);
        numbers.push(2);
    });
    numbers.push(3);
});
// on completion :: => '3 numbers!'    <<< because there are 3 numbers in the array






