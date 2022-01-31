INBOX_REPO=inbox
INBOX_REF=$(INBOX_REPO)@master
TRAIN_REPO=preprocess
TRAIN_REF=$(TRAIN_REPO)@master

DATA_FOLDER=data/names

.PHONY: setup
setup:
	pachctl create repo $(INBOX_REPO)
	@echo Setup done

.PHONY: first_commit
first_commit:
	pachctl start commit $(INBOX_REF)
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/Dutch.txt
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/Polish.txt
	pachctl finish commit $(INBOX_REF)

.PHONY: second_commit
second_commit:
	pachctl start commit $(INBOX_REF)
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/Arabic.txt*
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/Chinese.txt*
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/Czech.txt*
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/English.txt*
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/French.txt*
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/German.txt*
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/Greek.txt*
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/Irish.txt*
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/Italian.txt*
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/Japanese.txt*
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/Korean.txt*
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/Portuguese.txt*
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/Russian.txt*
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/Scottish.txt*
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/Spanish.txt*
	pachctl put file -r $(INBOX_REF): -f $(DATA_FOLDER)/Vietnamese.txt*
	pachctl finish commit $(INBOX_REF)


.PHONY: clean
clean:
	pachctl delete pipeline train
	pachctl delete pipeline preprocess
	pachctl delete repo $(INBOX_REPO)


