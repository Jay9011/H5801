/**
 * 
 */
document.addEventListener('DOMContentLoaded', function () {
    var Modalelem = document.querySelector('.modal');
    var instance = M.Modal.init(Modalelem, {dismissible:false, preventScrolling:false});
    instance.open();
});
