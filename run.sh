# dry run
snakemake -np

# Run
snakemake -p --latency-wait 400

# Submit jobs
mkdir -p logs && snakemake --cluster-config cluster.yaml  --cluster "sbatch --time {cluster.time} --mem {cluster.mem} --cpus-per-task {cluster.cpus} --job-name {cluster.jobname} -o {cluster.output} -e {cluster.error} --mail-user=arushiv@umich.edu --mail-type=FAIL --parsable" -j 60 -p --latency-wait 400

# print workflow
snakemake --dag | dot -Tsvg > workflow.svg
