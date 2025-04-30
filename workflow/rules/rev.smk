
rule concat:
    input:
        get_input_files
    output:
        txt="{output_dir}/{condition}-{replicate}-concat.txt"
    shell:
        """
        for f in {input}/*; do
            cat "$f" >> {output.txt}
            echo >> {output.txt}
        done
        """

rule reverse:
    input:
        txt="{output_dir}/{condition}-{replicate}-concat.txt"
    output:
        txt="{output_dir}/reverse/{condition}-{replicate}-rev.txt"
    conda:
        "../envs/core.yml"
    shell:
        """
        rev {input.txt} > {output.txt}
        """
