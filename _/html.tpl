<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"/>
    <title>__cmd__ __num__</title>
    <script type="application/javascript" src="Chart.min.js"></script>
    <style type="text/css">
        html, body {
            background: #fff;
            height: 100%;
            width: 100%;
            margin: 0;
        }
        canvas {
            display: block;
            position: absolute;
            bottom: 0.25em;
            top: 0.25em;
            left: 0.25em;
            right: 0.25em;
            height: 100%;
            width: 100%;
        }
        h1, div {
            margin: 0.25em 1em;
            text-align: right;
        }
    </style>
</head>
<body>
    <canvas id="mainChart" width="1024" height="512"></canvas>
    <h1>__cmd__ __num__</h1>
    <div>created at __creationtime__</div>
    <script type="application/javascript">
        new Chart(
            document.getElementById("mainChart").getContext("2d")
        ).Line({
            labels: [__lables__],
            datasets: [
                {
                    pointColor: "rgba(0,0,0,0.0)",
                    data: [0.9999]
                },
                {
                    label: "real",
                    strokeColor: "__creal__",
                    pointColor: "__creal__",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "__creal__",
                    data: [__dreal__]
                },
                {
                    label: "user",
                    strokeColor: "__cuser__",
                    pointColor: "__cuser__",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "__cuser__",
                    data: [__duser__]
                },
                {
                    label: "sys",
                    strokeColor: "__csys__",
                    pointColor: "__csys__",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "__csys__",
                    data: [__dsys__]
                }
            ]
        }, {
            responsive: true,
            datasetFill: false
        });
    </script>
</body>
</html>
