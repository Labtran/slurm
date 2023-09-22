<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="[https://github.com/othneildrew/Best-README-Template](https://slurm.schedmd.com/quickstart.html)">
    <img src="https://slurm.schedmd.com/slurm_logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Slurm</h3>

  <p align="center">
    Slurm Workload Manager
  </p>
</div>

<!-- Visão Geral -->
## Visão Geral

O Slurm é um sistema de código aberto, tolerante a falhas e altamente escalonável de gerenciamento de clusters e agendamento de tarefas para clusters grandes e pequenos do Linux. O Slurm não requer modificações no kernel para sua operação e é relativamente autônomo. Como um gerenciador de carga de trabalho de cluster, o Slurm tem três funções principais. Em primeiro lugar, ele aloca acesso exclusivo e/ou não exclusivo a recursos (nós de computação) aos usuários por algum período de tempo para que eles possam realizar o trabalho. Em segundo lugar, ele fornece uma estrutura para iniciar, executar e monitorar o trabalho (normalmente um trabalho paralelo) no conjunto de nós alocados. Por fim, ele arbitra a contenção de recursos gerenciando uma fila de trabalhos pendentes.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Manual

Apresentamos uma referência básica para o uso do Slurm e suas principais funcionalidades.

### Arquitetura

Conforme ilustrado na Figura 1, o Slurm consiste em um daemon slurmd executado em cada nó de computação e um daemon slurmctld central executado em um nó de gerenciamento (com um gêmeo opcional de failover). Os daemons slurmd fornecem comunicações hierárquicas tolerantes a falhas. Os comandos de usuário incluem: sacct, sacctmgr, salloc, sattach, sbatch, sbcast, scancel, scontrol, scrontab, sdiag, sh5util, sinfo, sprio, squeue, sreport, srun, sshare, sstat, strigger e sview. Todos os comandos podem ser executados em qualquer lugar do cluster.

![Alt text](https://slurm.schedmd.com/arch.gif "Figure 1. Slurm components")

As entidades gerenciadas por esses daemons do Slurm, mostradas na Figura 2, incluem nós, o recurso de computação no Slurm, partições, que agrupam os nós em conjuntos lógicos (possivelmente sobrepostos), trabalhos ou alocações de recursos atribuídos a um usuário por um período de tempo especificado e etapas de trabalho, que são conjuntos de tarefas (possivelmente paralelas) dentro de um trabalho. As partições podem ser consideradas filas de trabalho, cada uma das quais tem uma variedade de restrições, como limite de tamanho do trabalho, limite de tempo do trabalho, usuários autorizados a usá-lo etc. Os trabalhos ordenados por prioridade recebem nós em uma partição até que os recursos (nós, processadores, memória etc.) dessa partição se esgotem. Depois que um trabalho é atribuído a um conjunto de nós, o usuário pode iniciar o trabalho paralelo na forma de etapas de trabalho em qualquer configuração dentro da alocação. Por exemplo, pode ser iniciada uma única etapa de trabalho que utilize todos os nós alocados para o trabalho, ou várias etapas de trabalho podem usar independentemente uma parte da alocação.

![Alt text](https://slurm.schedmd.com/entities.gif "Figure 2. Slurm entities")

### Comandos

Existem páginas de manual para todos os daemons, comandos e funções de API do Slurm. A opção de comando --help também fornece um breve resumo das opções. Observe que todas as opções de comando diferenciam maiúsculas de minúsculas.

**sacct** é usado para relatar informações de contabilidade do trabalho ou da etapa do trabalho sobre trabalhos ativos ou concluídos.

**salloc** é usado para alocar recursos para um trabalho em tempo real. Normalmente, é usado para alocar recursos e gerar um shell. O shell é então usado para executar comandos srun para iniciar tarefas paralelas.

**sattach** é usado para anexar entrada, saída e erro padrão, além de recursos de sinal, a um trabalho ou etapa de trabalho em execução no momento. É possível anexar e desconectar trabalhos várias vezes.

**sbatch** é usado para enviar um script de trabalho para execução posterior. Normalmente, o script contém um ou mais comandos srun para iniciar tarefas paralelas.

**sbcast** é usado para transferir um arquivo do disco local para o disco local nos nós alocados para um trabalho. Isso pode ser usado para usar efetivamente nós de computação sem disco ou oferecer melhor desempenho em relação a um sistema de arquivos compartilhado.

**scancel** é usado para cancelar um trabalho ou etapa de trabalho pendente ou em execução. Também pode ser usado para enviar um sinal arbitrário a todos os processos associados a um trabalho ou etapa de trabalho em execução.

**scontrol** é a ferramenta administrativa usada para visualizar e/ou modificar o estado do Slurm. Observe que muitos comandos do scontrol só podem ser executados como usuário root.

**sinfo** informa o estado das partições e dos nós gerenciados pelo Slurm. Ele tem uma grande variedade de opções de filtragem, classificação e formatação.

**sprio** é usado para exibir uma visão detalhada dos componentes que afetam a prioridade de um trabalho.

**squeue** informa o estado de trabalhos ou etapas de trabalho. Ele tem uma grande variedade de opções de filtragem, classificação e formatação.Por padrão, ele informa os trabalhos em execução em ordem de prioridade e, em seguida, os trabalhos pendentes em ordem de prioridade.

**srun** é usado para enviar um trabalho para execução ou iniciar etapas de trabalho em tempo real. O srun tem uma grande variedade de opções para especificar os requisitos de recursos, incluindo: contagem mínima e máxima de nós, contagem de processadores, nós específicos a serem usados ou não e características específicas do nó (tanta memória, espaço em disco, determinados recursos necessários etc.). Um trabalho pode conter várias etapas de trabalho executadas sequencialmente ou em paralelo em recursos independentes ou compartilhados dentro da alocação de nós do trabalho.

**sshare** exibe informações detalhadas sobre o uso de fairshare no cluster. Observe que isso só é viável quando se usa o plug-in priority/multifactor.

**sstat** é usado para obter informações sobre os recursos utilizados por um trabalho ou etapa de trabalho em execução.strigger é usado para definir, obter ou visualizar acionadores de eventos.Os acionadores de eventos incluem coisas como nós que caem ou trabalhos que se aproximam do limite de tempo.sview é uma interface gráfica de usuário para obter e atualizar informações de estado de trabalhos, partições e nós gerenciados pelo Slurm.

<!-- USAGE EXAMPLES -->
## Exemplos

Primeiro, determinamos quais partições existem no sistema, quais nós elas incluem e o estado geral do sistema. Essas informações são fornecidas pelo comando **sinfo**.No exemplo abaixo, descobrimos que há duas partições: debug e batch. O * após o nome debug indica que essa é a partição padrão para trabalhos enviados.Vemos que ambas as partições estão em um estado UP. Algumas configurações podem incluir partições para trabalhos maiores que estão DOWN, exceto nos fins de semana ou à noite.As informações sobre cada partição podem ser divididas em mais de uma linha para que os nós em diferentes estados possam ser identificados. Nesse caso, os dois nós adev[1-2] estão inativos. O * após o estado down indica que os nós não estão respondendo.Observe o uso de uma expressão concisa para a especificação do nome do nó com um prefixo comum adev e intervalos numéricos ou números específicos identificados. Esse formato permite que clusters muito grandes sejam facilmente gerenciados. O comando **sinfo** tem muitas opções para permitir que você visualize facilmente as informações de seu interesse no formato que preferir. Consulte a página de manual para obter mais informações.

```
adev0: sinfo
PARTITION AVAIL  TIMELIMIT NODES  STATE NODELIST
debug*       up      30:00     2  down* adev[1-2]
debug*       up      30:00     3   idle adev[3-5]
batch        up      30:00     3  down* adev[6,13,15]
batch        up      30:00     3  alloc adev[7-8,14]
batch        up      30:00     4   idle adev[9-12]
```

Em seguida, determinamos quais trabalhos existem no sistema usando o comando **squeue**. O campo ST é o estado do trabalho. Dois trabalhos estão em um estado de execução (R é a abreviação de Running), enquanto um trabalho está em um estado pendente (PD é a abreviação de Pending).O campo TIME mostra por quanto tempo os trabalhos foram executados usando o formato dias-horas:minutos:segundos.O campo NODELIST(REASON) indica onde o trabalho está sendo executado ou o motivo pelo qual ele ainda está pendente.Os motivos típicos para trabalhos pendentes são Resources (aguardando a disponibilidade de recursos) e Priority (enfileirado atrás de um trabalho de prioridade mais alta).O comando **squeue** tem muitas opções para permitir que você visualize facilmente as informações de seu interesse no formato que preferir.Consulte a página de manual para obter mais informações.

```
adev0: squeue
JOBID PARTITION  NAME  USER ST  TIME NODES NODELIST(REASON)
65646     batch  chem  mike  R 24:19     2 adev[7-8]
65647     batch   bio  joan  R  0:09     1 adev14
65648     batch  math  phil PD  0:00     6 (Resources)
```
O comando **scontrol** pode ser usado para relatar informações mais detalhadas sobre nós, partições, trabalhos, etapas de trabalho e configuração. Ele também pode ser usado por administradores de sistema para fazer alterações na configuração. Alguns exemplos são mostrados abaixo.

```
adev0: scontrol show partition
PartitionName=debug TotalNodes=5 TotalCPUs=40 RootOnly=NO
   Default=YES OverSubscribe=FORCE:4 PriorityTier=1 State=UP
   MaxTime=00:30:00 Hidden=NO
   MinNodes=1 MaxNodes=26 DisableRootJobs=NO AllowGroups=ALL
   Nodes=adev[1-5] NodeIndices=0-4

PartitionName=batch TotalNodes=10 TotalCPUs=80 RootOnly=NO
   Default=NO OverSubscribe=FORCE:4 PriorityTier=1 State=UP
   MaxTime=16:00:00 Hidden=NO
   MinNodes=1 MaxNodes=26 DisableRootJobs=NO AllowGroups=ALL
   Nodes=adev[6-15] NodeIndices=5-14


adev0: scontrol show node adev1
NodeName=adev1 State=DOWN* CPUs=8 AllocCPUs=0
   RealMemory=4000 TmpDisk=0
   Sockets=2 Cores=4 Threads=1 Weight=1 Features=intel
   Reason=Not responding [slurm@06/02-14:01:24]

65648     batch  math  phil PD  0:00     6 (Resources)
adev0: scontrol show job
JobId=65672 UserId=phil(5136) GroupId=phil(5136)
   Name=math
   Priority=4294901603 Partition=batch BatchFlag=1
   AllocNode:Sid=adev0:16726 TimeLimit=00:10:00 ExitCode=0:0
   StartTime=06/02-15:27:11 EndTime=06/02-15:37:11
   JobState=PENDING NodeList=(null) NodeListIndices=
   NumCPUs=24 ReqNodes=1 ReqS:C:T=1-65535:1-65535:1-65535
   OverSubscribe=1 Contiguous=0 CPUs/task=0 Licenses=(null)
   MinCPUs=1 MinSockets=1 MinCores=1 MinThreads=1
   MinMemory=0 MinTmpDisk=0 Features=(null)
   Dependency=(null) Account=(null) Requeue=1
   Reason=None Network=(null)
   ReqNodeList=(null) ReqNodeListIndices=
   ExcNodeList=(null) ExcNodeListIndices=
   SubmitTime=06/02-15:27:11 SuspendTime=None PreSusTime=0
   Command=/home/phil/math
   WorkDir=/home/phil

```

É possível criar uma alocação de recursos e iniciar as tarefas de uma etapa de trabalho em uma única linha de comando usando o comando **srun**. Dependendo da implementação de MPI usada, os trabalhos de MPI também podem ser iniciados dessa maneira. Consulte a seção MPI para obter mais informações específicas sobre MPI.Neste exemplo, executamos **/bin/hostname** em três nós (-N3) e incluímos números de tarefas na saída (-l). A partição padrão será usada. Uma tarefa por nó será usada por padrão. Observe que o comando **srun** tem muitas opções disponíveis para controlar quais recursos são alocados e como as tarefas são distribuídas entre esses recursos.

```
adev0: srun -N3 -l /bin/hostname
0: adev3
1: adev4
2: adev5
```

Essa variação do exemplo anterior executa o **/bin/hostname** em quatro tarefas (-n4). Um processador por tarefa será usado por padrão (observe que não especificamos uma contagem de nós).
```
adev0: srun -n4 -l /bin/hostname
0: adev3
1: adev3
2: adev3
3: adev3
```

Um modo comum de operação é enviar um script para execução posterior. Neste exemplo, o nome do script é my.script e usamos explicitamente os nós adev9 e adev10 (-w "adev[9-10]", observe o uso de uma expressão de intervalo de nós). Também declaramos explicitamente que as etapas subsequentes do trabalho gerarão quatro tarefas cada, o que garantirá que nossa alocação contenha pelo menos quatro processadores (um processador por tarefa a ser iniciada). A saída aparecerá no arquivo my.stdout ("-o my.stdout"). Esse script contém um limite de tempo para o trabalho incorporado nele mesmo. Outras opções podem ser fornecidas conforme desejado usando um prefixo de "#SBATCH" seguido da opção no início do script (antes de qualquer comando a ser executado no script). As opções fornecidas na linha de comando substituem as opções especificadas no script. Observe que my.script contém o comando **/bin/hostname** que foi executado no primeiro nó da alocação (onde o script é executado), além de duas etapas de trabalho iniciadas com o comando **srun** e executadas sequencialmente.
```
adev0: cat my.script
#!/bin/sh
#SBATCH --time=1
/bin/hostname
srun -l /bin/hostname
srun -l /bin/pwd

adev0: sbatch -n4 -w "adev[9-10]" -o my.stdout my.script
sbatch: Submitted batch job 469

adev0: cat my.stdout
adev9
0: adev9
1: adev9
2: adev10
3: adev10
0: /home/jette
1: /home/jette
2: /home/jette
3: /home/jette
```
O modo final de operação é criar uma alocação de recursos e gerar etapas de trabalho dentro dessa alocação. O comando **salloc** é usado para criar uma alocação de recursos e, normalmente, iniciar um shell dentro dessa alocação. Normalmente, uma ou mais etapas de trabalho seriam executadas dentro dessa alocação usando o comando **srun** para iniciar as tarefas (dependendo do tipo de MPI que está sendo usado, o mecanismo de lançamento pode ser diferente; consulte os detalhes de MPI abaixo). Por fim, o shell criado por **salloc** seria encerrado com o comando exit. O Slurm não migra automaticamente arquivos executáveis ou de dados para os nós alocados para um trabalho. Os arquivos devem existir no disco local ou em algum sistema de arquivos global (por exemplo, NFS ou Lustre). Fornecemos a ferramenta **sbcast** para transferir arquivos para o armazenamento local em nós alocados usando as comunicações hierárquicas do Slurm. Neste exemplo, usamos o **sbcast** para transferir o programa executável a.out para /tmp/joe.a.out no armazenamento local dos nós alocados. Depois de executar o programa, nós o excluímos do armazenamento local.

```
tux0: salloc -N1024 bash
$ sbcast a.out /tmp/joe.a.out
Granted job allocation 471
$ srun /tmp/joe.a.out
Result is 3.14159
$ srun rm /tmp/joe.a.out
$ exit
salloc: Relinquishing job allocation 471
```
Neste exemplo, enviamos um trabalho em lote, obtemos seu status e o cancelamos.

```
adev0: sbatch test
srun: jobid 473 submitted

adev0: squeue
JOBID PARTITION NAME USER ST TIME  NODES NODELIST(REASON)
  473 batch     test jill R  00:00 1     adev9

adev0: scancel 473

adev0: squeue
JOBID PARTITION NAME USER ST TIME  NODES NODELIST(REASON)
```




<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Práticas recomendadas, grandes volumes de trabalho -->
## Práticas recomendadas, grandes volumes de trabalho 

Considere colocar o trabalho relacionado em um único trabalho do Slurm com várias etapas de trabalho por motivos de desempenho e facilidade de gerenciamento. Cada trabalho do Slurm pode conter várias etapas de trabalho e a sobrecarga do Slurm para gerenciar as etapas de trabalho é muito menor do que a de trabalhos individuais.

As [matrizes de trabalhos ou job arrays](https://slurm.schedmd.com/job_array.html) são um mecanismo eficiente de gerenciamento de uma coleção de trabalhos em lote com requisitos de recursos idênticos. A maioria dos comandos do Slurm pode gerenciar matrizes de trabalhos como elementos individuais (tarefas) ou como uma única entidade (por exemplo, excluir uma matriz de trabalhos inteira em um único comando).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## MPI

MPI use depends upon the type of MPI being used. There are three fundamentally different modes of operation used by these various MPI implementations.

 - Slurm directly launches the tasks and performs initialization of communications through the PMI2 or PMIx APIs. (Supported by most modern MPI implementations.)

 - Slurm creates a resource allocation for the job and then mpirun launches tasks using Slurm's infrastructure (older versions of OpenMPI).

 - Slurm creates a resource allocation for the job and then mpirun launches tasks using some mechanism other than Slurm, such as SSH or RSH. These tasks are initiated outside of Slurm's monitoring or control. Slurm's epilog should be configured to purge these tasks when the job's allocation is relinquished. The use of pam_slurm_adopt is also strongly recommended.

Os links para instruções de uso de diversas variedades de MPI com o Slurm são fornecidos abaixo.


- [Intel MPI](https://slurm.schedmd.com/mpi_guide.html#intel_mpi)
- [MPICH2](https://slurm.schedmd.com/mpi_guide.html#mpich2)
- [MVAPICH2](https://slurm.schedmd.com/mpi_guide.html#mvapich2)
- [Open MPI](https://slurm.schedmd.com/mpi_guide.html#open_mpi)


<!-- CONTACT -->
## Contato

Paulo de Tarço - [@ptarcode](https://twitter.com/ptarcode) - ptarco@iprj.uerj.br

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- Referências -->
## Referências

* [Quick Start User Guide](https://slurm.schedmd.com/quickstart.html)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
