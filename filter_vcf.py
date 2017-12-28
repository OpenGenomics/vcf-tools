#!/usr/bin/env python

import argparse
import vcf


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--tumor", default="PRIMARY")
    parser.add_argument("--normal", default="NORMAL")
    parser.add_argument("--ad", type=int, default=None)
    parser.add_argument("vcf")
    parser.add_argument("out")

    args = parser.parse_args()

    vcf_reader = vcf.Reader(open(args.vcf, 'r'))
    vcf_writer = vcf.Writer(open(args.out, 'w'), vcf_reader)

    for record in vcf_reader:
        keep = True
        if args.ad is not None:
            for call in record.samples:
                if call.sample == args.tumor:
                    for n, d in call.data._asdict().items():
                        if n == "AD" and d[1] < args.ad:
                            keep = False
        if keep:
            vcf_writer.write_record(record)
