
all: mcmcGPU makeSeqfile mcmcCPUgen

mcmcGPU: mcmcGPU.c gpuSetup.c clErrors.h
	@echo -e "Remember to do 'module load cuda' and 'module load gcc'\n"
	gcc -O3 -lm -lOpenCL mcmcGPU.c gpuSetup.c common/epsilons.c common/stdPanic.c -o mcmcGPU

makeSeqfile: makeSeqfile.c
	gcc -O3 makeSeqfile.c -o makeSeqfile

mcmcCPUgen: mcmcCPUgen.c common/epsilons.c common/epsilons.h
	gcc -O3 -lm mcmcCPUgen.c common/epsilons.c -o mcmcCPUgen
