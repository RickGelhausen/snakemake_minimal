def get_input_files(wildcards):
    row = samples[(samples["condition"] == wildcards.condition) & (samples["replicate"] == int(wildcards.replicate))]
    return row["filePath"].iloc[0]


def get_rev_paths(wildcards):
    rows = samples[samples["replicate"] == int(wildcards.replicate)]

    untreated = rows[rows["treatment"] == "untreated"]
    treated = rows[rows["treatment"] == "treated"]

    if len(untreated) != 1 or len(treated) != 1:
        raise ValueError(f"Expected one treated and one untreated for replicate {wildcards.replicate}, got {len(treated)} treated and {len(untreated)} untreated")

    untreated_path = f"{wildcards.output_dir}/reverse/{untreated.iloc[0].condition}-{wildcards.replicate}-rev.txt"
    treated_path = f"{wildcards.output_dir}/reverse/{treated.iloc[0].condition}-{wildcards.replicate}-rev.txt"

    return [untreated_path, treated_path]