module Seq

using Compat
using BufferedStreams
using Switch
using Base.Intrinsics

import Base: convert, complement, show, length, start, next, done, copy, copy!,
             reverse, show, endof, isless, clipboard, parse, repeat,
             unsafe_copy!, read, read!, open, eltype,
             # operators
             getindex, setindex!, ==, *, ^, |, &


using Bio: FileFormat, AbstractParser
using Bio.StringFields
using Bio.Ragel

export Nucleotide, DNANucleotide, RNANucleotide,
       DNA_A, DNA_C, DNA_G, DNA_T, DNA_N,
       RNA_A, RNA_C, RNA_G, RNA_U, RNA_N,
       Sequence, NucleotideSequence, DNASequence, RNASequence, @dna_str, @rna_str,
       ismutable, mutable!, immutable!,
       reverse_complement, mismatches, npositions, hasn, eachsubseq,
       canonical, neighbors, eachkmer, each, NucleotideCounts,
       Kmer, DNAKmer, RNAKmer, dnakmer, rnakmer,
       kmer, KmerCounts, DNAKmerCounts, RNAKmerCounts,
       AminoAcid, AminoAcidSequence, @aa_str, translate, ncbi_trans_table,
       AA_A, AA_R, AA_N, AA_D, AA_C, AA_Q, AA_E, AA_G, AA_H, AA_I, AA_L,
       AA_K, AA_M, AA_F, AA_P, AA_S, AA_T, AA_W, AA_Y, AA_V, AA_X,
       FASTA, FASTQ, Alphabet

abstract Sequence

include("nucleotide.jl")
include("aminoacid.jl")
include("geneticcode.jl")
include("util.jl")
include("alphabet.jl")
include("quality.jl")
include("seqrecord.jl")


# Parsing of various file types
include("fasta.jl")
include("fastq.jl")


# This is useful for obscure reasons. We use SeqRecord{Sequence} for reading
# sequence in an undetermined alphabet, but a consequence that we need to be
# able to construct a `Sequence`.
function Sequence()
    return DNASequence()
end


end # module Seq
