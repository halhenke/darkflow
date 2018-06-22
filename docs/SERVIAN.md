## Why?

Had to change a couple of things to get running

## Install

- Main page lists depedndecies as
    - Python3,
    - tensorflow,
    - numpy,
    - opencv
- However you will also need Cython installed for anything to work



## Run

- I put Images in `train\xml\Images` & annotations in `train\xml\Annotations`
- I included a crappy Makefile (I'm not good at Makefiles) - you prob want to change some paths to match your own machine if you want to use it but otherwise will give an idea of how to call it
- `make darkflow-train-forklift-xml` will start training with default parameters (1000 epochs, save checkpoint every 2000 images)
- `make darkflow-train-with-update` will load the weights from the latest checkpoint and keep training so you can keep improving (hopefully) the model
- `make darkflow-test-images` will do predictions on a folder of test images
- `make darkflow-test-images-json` will do the same but will also output json files with any bounding boxes
