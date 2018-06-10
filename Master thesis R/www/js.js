

function btn_continue_click() {
    var testMatrix = new Array(2);
    for (var i = 0; i < 4; i++) {
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

    testMatrix[3][0] = "1 sample wilcoxon";
    testMatrix[3][1] = "2 sample wilcoxon";

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
    var data = new Array(2);
    var datax = [0.143561142,-0.193498825,0.623096219,0.009646641,-0.474438322,-0.584871407,1.117821625,-0.562827395,0.068982769,-0.328809884];
    var datay = [0.79170782,-1.03024246,-0.98014139,-1.23814736,0.04561973,-0.21190141,1.45086513,1.28303213,2.08145402,-0.81507561];
    data[0] = datax;
    data[1] = datay;
    Shiny.onInputChange("selectedTest", selectedTest);
    Shiny.onInputChange("numberOfSamples", q2value);

}


Shiny.addCustomMessageHandler('showMsg',
    function (value) {
        alert(value.text);
    }
);
