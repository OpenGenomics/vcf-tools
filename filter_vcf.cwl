cwlVersion: v1.0
class: CommandLineTool

label: Merge VCFs

requirements:
  - class: DockerRequirement
    dockerPull: opengenomics/vcftools-tools:latest

baseCommand: [python, /opt/filter_vcf.py]

inputs:
  no_ad:
    type: boolean
    default: false
    inputBinding:
      prefix: --no-ad

  output_name:
    type: string
    default: output.vcf
    inputBinding:
      position: 3

  cutoff:
    type: int?
    inputBinding:
      prefix: --cutoff

  vcf:
    type: File
    inputBinding:
      position: 2

outputs:
  output_vcf:
    type: File
    outputBinding:
      glob: $(inputs.output_name)
