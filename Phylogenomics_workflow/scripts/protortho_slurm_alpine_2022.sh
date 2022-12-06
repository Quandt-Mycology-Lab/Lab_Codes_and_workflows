#!/bin/bash
#SBATCH --nodes=1                               # Number of requested nodes
#SBATCH --time=12:00:00                        # Max wall time DD:hh:mm:ss
#SBATCH --partition=amilan               # Specify Alpine nodes
#SBATCH --ntasks=12                              # Number of tasks per job
#SBATCH --job-name=proteinortho        # Job submission name
#SBATCH --output=Protortho_Leotio_2022_v2.%j.out   # Output file name with Job ID../
#SBATCH --mail-type=END,FAIL,TIME_LIMIT,TIME_LIMIT_90
#SBATCH --mail-user=alisha.quandt@colorado.edu

# Updated:         Dec 6 2022
# Purpose:         Proteinortho Leotio



# purge all existing modules
ml purge


# load any modules needed to run your program


# The directory where you want the job to run
#cd /scratch/summit/caqu8258/Crypto/

ulimit -c 0

# Run your program
source ~/.proto6
proteinortho -clean -project=dec22_leot -cpus=$SLURM_NTASKS Acema.names.fas Amore.names.fas Amyenc.names.fas Antapell.names.fas Aotenoth.names.fas Ascsa.names.fas Bissp.names.fas Blugr.names.fas Botci.names.fas Bulin.names.fas Cadsp.names.fas Calmar.names.fas Chaetobl.names.fas Chalo.names.fas Chlaerug.names.fas Clausatr.names.fas Cocst.names.fas Cudcirc.names.fas Duranemo.names.fas Duranpse.names.fas Elyde.names.fas Erynec.names.fas Gelatsiam.names.fas Glalo.names.fas Golci.names.fas Greab.names.fas Holwmuc.names.fas Hymvar.names.fas Lacsu.names.fas Lepor.names.fas Leptod.names.fas Lopnit.names.fas Lorju.names.fas Marbr.names.fas Marthpha.names.fas Melbi.names.fas Micruf.names.fas Mitrpal.names.fas Neucr.names.fas Oidma.names.fas Pezweb.names.fas Phacilac.names.fas Phimu.names.fas Phisc.names.fas Piliacer.names.fas Pleurnic.names.fas Potebpyr.names.fas Propfar.names.fas Pseel.names.fas Pseudest.names.fas Pseudpan.names.fas Rhesp.names.fas Rhier.names.fas Rosrhod.names.fas Rutfi.names.fas Sclsc.names.fas Spafl.names.fas Stampers.names.fas Themi.names.fas Thest.names.fas Xenopyri.names.fas Xylhe.names.fas Zalva.names.fas Allantocyti.names.fas Allantolyco.names.fas Claussp.names.fas

