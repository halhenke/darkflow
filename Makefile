train-forklift-yolo:
	./flow --model cfg/forklift.cfg --load bin/yolo.weights --train --annotation train/yolo-format/Annotations --dataset train/yolo-format/Images

train-forklift-xml:
	./flow --model cfg/forklift.cfg --load bin/yolo.weights --train --annotation train/xml/Annotations --dataset train/xml/Images


DARKFLOW_PATH=.
DARKFLOW_BIN=./flow
DARKFLOW_WEIGHTS=./bin/yolo.weights
DARKFLOW_CFG=./cfg/forklift.cfg
DARKFLOW_NEWER_IMGS=../Forklft_Vid/mp4/vott/tensorflow-voc/ch03_20180501085635/JPEGImages
DARKFLOW_ORIG_IMGS=../Forklft_Vid/mp4/vott/tensorflow-voc/ch03/JPEGImages
DARKFLOW_THRESHOLD=0.5
DARKFLOW_ANNOTATIONS=$(DARKFLOW_PATH)/train/xml/Annotations
DARKFLOW_IMAGES=$(DARKFLOW_PATH)/train/xml/Images



darkflow-train-update:
	$(DARKFLOW_BIN) \
		--train \
		--model $(DARKFLOW_CFG) \
		--load -1 \
		--epoch 100 \
		--save 50 \
		--annotation $(DARKFLOW_ANNOTATIONS) \
		--dataset $(DARKFLOW_IMAGES)
