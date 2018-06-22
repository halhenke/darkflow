DARKFLOW_PATH=.
DARKFLOW_BIN=$(DARKFLOW_PATH)/flow
ORIGINAL_WEIGHTS=$(DARKFLOW_PATH)/bin/yolo.weights
FORKLIFT_CFG=$(DARKFLOW_PATH)/cfg/forklift.cfg
FORKLIFT_LABELS=$(DARKFLOW_PATH)/labels-forklift.txt
MP4_PATH=../Forklft_Vid/mp4
DARKFLOW_ORIG_TEST_IMGS=$(MP4_PATH)/vott/tensorflow-voc/ch03/JPEGImages
DARKFLOW_TEST_IMGS_02=$(MP4_PATH)/vott/tensorflow-voc/ch08/JPEGImages
# DARKFLOW_TEST_IMGS_01=$(MP4_PATH)/vott/tensorflow-voc/ch03_20180501085635/JPEGImages
DARKFLOW_THRESHOLD=0.5
DARKFLOW_ANNOTATIONS=$(DARKFLOW_PATH)/train/xml/Annotations
DARKFLOW_IMAGES=$(DARKFLOW_PATH)/train/xml/Images

# PARAMETERS
UPDATED_WEIGHTS=-1
EPOCHS=100
SAVE_AFTER_BATCH=100


darkflow-train-forklift-yolo:
	$(DARKFLOW_BIN) \
		--train \
		--model $(FORKLIFT_CFG) \
		--load $(ORIGINAL_WEIGHTS) \
		--labels $(FORKLIFT_LABELS) \
		--annotation $(DARKFLOW_ANNOTATIONS) \
		--dataset $(DARKFLOW_IMAGES)

darkflow-train-forklift-xml:
	$(DARKFLOW_BIN) \
		--train \
		--model $(FORKLIFT_CFG) \
		--load $(ORIGINAL_WEIGHTS) \
		--labels $(FORKLIFT_LABELS) \
		--annotation $(DARKFLOW_ANNOTATIONS) \
		--dataset $(DARKFLOW_IMAGES)



darkflow-train-with-update:
	$(DARKFLOW_BIN) \
		--train \
		--model $(FORKLIFT_CFG) \
		--labels $(FORKLIFT_LABELS) \
		--load $(UPDATED_WEIGHTS) \
		--epoch $(EPOCHS) \
		--save $(SAVE_AFTER_BATCH) \
		--annotation $(DARKFLOW_ANNOTATIONS) \
		--dataset $(DARKFLOW_IMAGES)


darkflow-test-images:
	$(DARKFLOW_BIN) \
		--model $(FORKLIFT_CFG) \
		--load $(UPDATED_WEIGHTS) \
		--imgdir $(DARKFLOW_TEST_IMGS_02) \
		--threshold $(DARKFLOW_THRESHOLD)

darkflow-test-images-json:
	$(DARKFLOW_BIN) \
		--model $(FORKLIFT_CFG) \
		--load $(UPDATED_WEIGHTS) \
		--imgdir $(DARKFLOW_TEST_IMGS_02) \
		--threshold $(DARKFLOW_THRESHOLD) \
		--json
