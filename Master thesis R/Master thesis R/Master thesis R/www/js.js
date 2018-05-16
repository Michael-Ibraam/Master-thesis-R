function initialize() {

    var testMatrix = new Array(2);
    for (var i = 0; i < 3; i++) {
        testMatrix[i] = new Array(4);
    }
   testMatrix[0][0] = "1 sample proportion";
   testMatrix[0][1] = "2 sample proportion";
   testMatrix[0][2] = "2 sample proportion";
   testMatrix[0][3] = "";

   testMatrix[1][0] = "1 sample t";
   testMatrix[1][1] = "2 sample t";
   testMatrix[1][2] = "2 sample t paired t";
   testMatrix[1][3] = "one way anova";

   testMatrix[2][2] = "correlation";
}

function btn_continue_click() {
    var testMatrix = new Array(2);
    for (var i = 0; i < 3; i++) {
        testMatrix[i] = new Array(4);
    }
    testMatrix[0][0] = "1 sample proportion";
    testMatrix[0][1] = "2 sample proportion";
    testMatrix[0][2] = "2 sample proportion";

    testMatrix[1][0] = "1 sample t";
    testMatrix[1][1] = "2 sample t";
    testMatrix[1][2] = "2 sample t paired t";
    testMatrix[1][3] = "one way anova";

    testMatrix[2][2] = "correlation";

    var q1 = document.getElementById("q1");
    var q1value = q1.options[q1.selectedIndex].value;

    var q2 = document.getElementById("q2");
    var q2value = q2.options[q2.selectedIndex].value;

    var q3 = document.getElementById("q3");
    var q3value = q3.options[q3.selectedIndex].value;
    var selectedTest = "";

    // if compare data
    if (q3value == "1") {
        var selectedTest = testMatrix[q1value][q2value];
    } else {
        var selectedTest = testMatrix[2][q2value];
    }
    alert(selectedTest);
}

Shiny.addCustomMessageHandler('showMsg',
    function (value) {
        alert(value.text);
    }
);
