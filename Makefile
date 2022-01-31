INBOX_REPO=inbox
INBOX_REF=$(INBOX_REPO)@master
TRAIN_REPO=preprocess
TRAIN_REF=$(TRAIN_REPO)@master

DATA_FOLDER=data

.PHONY: setup
setup:
	pachctl create repo $(INBOX_REPO)

	pachctl start commit $(INBOX_REF)
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/raw/Dutch.txt
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/raw/Polish.txt
	pachctl finish commit $(INBOX_REF)

	# pachctl create repo $(TRAIN_REPO)
	# pachctl start commit $(TRAIN_REF)
	# pachctl put file -r $(TRAIN_REF):/ -f $(DATA_FOLDER)/names/
	# pachctl finish commit $(TRAIN_REF)

	@echo Setup done

.PHONY: clean
clean:
	pachctl delete pipeline train
	pachctl delete pipeline preprocess
	pachctl delete repo $(INBOX_REPO)
	pachctl delete repo $(TRAIN_REPO)


