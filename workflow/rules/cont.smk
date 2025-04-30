rule combine:
    input:
        get_rev_paths
    output:
        txt="{output_dir}/combined/file-{replicate}.txt"
    shell:
        """
        cat {input[0]} {input[1]} > {output.txt}
        """