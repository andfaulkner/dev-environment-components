/**************************************************************************************************/
/***************************************** Object.create ******************************************/
/**************************************************************************************************/

//
// EXAMPLE USE OF Object.create
//

const User = function(firstName, lastName, password) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.password = password;
};

User.prototype.getFullName = function getFullName() {
    return this.firstName + ' ' + this.lastName;
};

const Meeka = new User('meeka', 'faulkner', 'woofwoof');

console.log(Meeka.getFullName()); // => "meeka faulkner"

const AdminUser = function(firstName, lastName, password, secret) {
    User.call(this, firstName, lastName, password);
    this.secret = secret;
};

AdminUser.prototype = Object.create(User.prototype);
AdminUser.prototype.constructor = AdminUser;

const CallieAdmin = new AdminUser('callie', 'peeke', 'arfarf', 'I ate one of the cats');

console.log(CallieAdmin.getFullName()); // => "callie peeke"
console.log(CallieAdmin.secret); // => "I ate one of the cats"

User.prototype.getFullName = function() {
    const fNameCap =
        this.firstName.charAt(0).toUpperCase() +
        this.firstName.slice(1).toLowerCase();
    const lNameCap =
        this.lastName.charAt(0).toUpperCase() +
        this.lastName.slice(1).toLowerCase();
    return 'Woofdog ' + fNameCap + ' ' + lNameCap;
}

/**
 * Below, notice that getFullName now not only capitalizes the names for instances of the
 * User object (as expected, since where the prototype was actually modified), but also for
 * instances of the AdminUser object (class?). This is because AdminUser.prototype actually
 * stores a *reference to* User.prototype, rather than a *copy of* User.prototype. Thus,
 * modifying a value on User.prototype results in automatically modifying that same value
 * on AdminUser at the same time.
*/
console.log(Meeka.getFullName());
// => "Woofdog Meeka Faulkner"

console.log(CallieAdmin.getFullName());
// => "Woofdog Callie Peeke"
