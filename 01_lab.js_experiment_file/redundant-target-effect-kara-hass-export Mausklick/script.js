// Define study
const study = lab.util.fromObject({
  "title": "root",
  "type": "lab.flow.Sequence",
  "parameters": {},
  "plugins": [
    {
      "type": "lab.plugins.Metadata",
      "path": undefined
    },
    {
      "type": "lab.plugins.Download",
      "filePrefix": "redundant-target-effect-kara-hass",
      "path": undefined
    }
  ],
  "metadata": {
    "title": "Redundant Target Effect - Kara Haß",
    "description": "",
    "repository": "",
    "contributors": ""
  },
  "files": {},
  "responses": {},
  "content": [
    {
      "type": "lab.html.Page",
      "items": [
        {
          "type": "text",
          "title": "Instruktionen",
          "content": "Das Experiment beginnt gleich.\n\u003Cp\u003E Bitte schauen Sie durchgängig auf den roten Punkt in der Mitte des Bildschirms.\u003C\u002Fp\u003E\n\n\u003Cp\u003EDrücken Sie die Maustaste, wenn Sie einen Lichtblitz sehen oder einen Ton hören. Sie können einzeln oder zusammen auftreten.\u003C\u002Fp\u003E\n\nReagieren Sie so schnell und genau wie möglich."
        }
      ],
      "scrollTop": true,
      "submitButtonText": "Experiment starten →",
      "submitButtonPosition": "right",
      "files": {},
      "responses": {
        "": ""
      },
      "parameters": {},
      "messageHandlers": {},
      "title": "Instructions"
    },
    {
      "type": "lab.canvas.Screen",
      "content": [
        {
          "type": "circle",
          "left": 0,
          "top": 0,
          "angle": 0,
          "width": "5",
          "height": 55,
          "stroke": null,
          "strokeWidth": 1,
          "fill": "#d6341a"
        }
      ],
      "viewport": [
        800,
        600
      ],
      "files": {},
      "responses": {
        "": ""
      },
      "parameters": {},
      "messageHandlers": {
        "run": function anonymous(
) {
document.body.style.backgroundColor = "black"
document.querySelector(".container").style.border = "none"
}
      },
      "title": "Change Background",
      "timeout": "3000"
    },
    {
      "type": "lab.flow.Loop",
      "templateParameters": [
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "AV",
          "aud": 1,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "V",
          "aud": 0,
          "vis": "grey"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        },
        {
          "condition": "A",
          "aud": 1,
          "vis": "black"
        }
      ],
      "sample": {
        "mode": "sequential",
        "n": "91"
      },
      "files": {},
      "responses": {
        "": ""
      },
      "parameters": {},
      "messageHandlers": {
        "run": function anonymous(
) {
document.body.style.backgroundColor = "black"
document.querySelector(".container").style.border = "none"
}
      },
      "title": "Loop",
      "shuffleGroups": [
        [
          "condition",
          "aud",
          "vis"
        ]
      ],
      "template": {
        "type": "lab.canvas.Frame",
        "context": "\u003C!-- Nested components use this canvas --\u003E\n\u003Ccanvas \u002F\u003E",
        "contextSelector": "canvas",
        "files": {},
        "responses": {
          "": ""
        },
        "parameters": {},
        "messageHandlers": {},
        "title": "Frame",
        "content": {
          "type": "lab.flow.Sequence",
          "files": {},
          "responses": {
            "": ""
          },
          "parameters": {},
          "messageHandlers": {},
          "title": "Trial",
          "content": [
            {
              "type": "lab.canvas.Screen",
              "content": [
                {
                  "type": "circle",
                  "left": 0,
                  "top": 0,
                  "angle": 0,
                  "width": "5",
                  "height": 55,
                  "stroke": null,
                  "strokeWidth": 1,
                  "fill": "#d6341a"
                }
              ],
              "viewport": [
                800,
                600
              ],
              "files": {},
              "responses": {
                "": ""
              },
              "parameters": {},
              "messageHandlers": {},
              "title": "Fixation",
              "timeout": "${ this.random.range(1500, 2500) }"
            },
            {
              "type": "lab.canvas.Screen",
              "content": [
                {
                  "type": "circle",
                  "left": 0,
                  "top": 0,
                  "angle": 0,
                  "width": 55,
                  "height": 55,
                  "stroke": null,
                  "strokeWidth": 1,
                  "fill": "${parameters.vis}"
                },
                {
                  "type": "circle",
                  "left": 0,
                  "top": 0,
                  "angle": 0,
                  "width": "5",
                  "height": 55,
                  "stroke": null,
                  "strokeWidth": 1,
                  "fill": "#d6341a"
                }
              ],
              "viewport": [
                800,
                600
              ],
              "files": {
                "100ms3500Hz10msFade.mp3": "embedded\u002F6973e59db29fbf654d8e3b29edc67cdcf02a62dab14076142d6c11edfe16e024.mp3"
              },
              "responses": {
                "": ""
              },
              "parameters": {},
              "messageHandlers": {
                "before:prepare": function anonymous(
) {
const sound = document.createElement('audio')
sound.src = this.files["100ms3500Hz10msFade.mp3"] 
sound.volume = this.aggregateParameters.aud
this.internals.sound = sound
},
                "run": function anonymous(
) {
this.internals.sound.play()
}
              },
              "title": "Stimulus",
              "timeout": "100",
              "timeline": []
            },
            {
              "type": "lab.canvas.Screen",
              "content": [
                {
                  "type": "circle",
                  "left": 0,
                  "top": 0,
                  "angle": 0,
                  "width": "5",
                  "height": 55,
                  "stroke": null,
                  "strokeWidth": 1,
                  "fill": "#d6341a"
                }
              ],
              "viewport": [
                800,
                600
              ],
              "files": {},
              "responses": {
                "mousedown": "stim_detected"
              },
              "parameters": {},
              "messageHandlers": {},
              "title": "Reaction",
              "timeout": "1500"
            }
          ]
        }
      }
    },
    {
      "type": "lab.html.Page",
      "items": [
        {
          "type": "text",
          "content": "Das Experiment ist nun beendet. Bitte Daten speichern!",
          "title": "Vielen Dank für die Teilnahme!"
        }
      ],
      "scrollTop": true,
      "submitButtonText": "Daten speichern →",
      "submitButtonPosition": "right",
      "files": {},
      "responses": {
        "": ""
      },
      "parameters": {},
      "messageHandlers": {
        "run": function anonymous(
) {
document.body.style.backgroundColor = "white"
document.querySelector(".container").style.border = "black"
}
      },
      "title": "end"
    }
  ]
})

// Let's go!
study.run()