document.addEventListener('DOMContentLoaded', function () {
    var stack;
    stack = gajus.Swing.Stack();
    [].forEach.call(document.querySelectorAll('.stack li'), function (targetElement) {
        stack.createCard(targetElement);
        targetElement.classList.add('in-deck');
    });

    stack.on('throwout', function (e) {
        e.target.classList.remove('in-deck');
    });

    stack.on('throwin', function (e) {
        e.target.classList.add('in-deck');
    });
});
