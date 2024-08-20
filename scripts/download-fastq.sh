#!/bin/bash

# Set some usful settings to handle errors in the script
set -eou pipefail

# Define ULRs and file paths
FASTQ_R1="subset-SRR11518889_1.fastq.gz"
FASTQ_R2="subset-SRR11518889_2.fastq.gz"
FASTQ_URL="https://raw.githubusercontent.com/AlexsLemonade/reproducible-research/main/instructor_notes/fastq_subset"

DATA_DIR="../data/raw/fastq/SRP255885"
mkdir -p ${DATA_DIR}

##### Process the R1 file####
echo "Downloading the R1 file"


#Download
# -O: keep same file name as on internet
# -s: don't print status bar or errors
# -S: but actually I do want to print errors
curl -sSO ${FASTQ_URL}/${FASTQ_R1}

#Move the file
mv ${FASTQ_R1} ${DATA_DIR}/
echo "The R1 has this many lines"

# Print the number of the lines in the file THe pipe "|" will send the unzipped file to wc
gunzip -c ${DATA_DIR}/${FASTQ_R1} | wc -l

#####Process the R2 file #######
echo "Downloading the R2 file"
#Download
curl -sSO ${FASTQ_URL}/${FASTQ_R2}

#Move the file
mv ${FASTQ_R2} ${DATA_DIR}/
echo "The R2 has this many lines"

# Print the number of the lines in the file 
gunzip -c ${DATA_DIR}/${FASTQ_R2} | wc -l
