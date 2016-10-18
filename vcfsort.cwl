cwlVersion: v1.0
class: CommandLineTool

requirements:
    DockerRequirement:
        dockerPull: vcfsort

baseCommand: [vcf-sort, -c]

inputs:
    vcf:
        type: File
stdin: $(inputs.vcf.path)
stdout: sorted.vcf
outputs:
    outvcf: stdout
