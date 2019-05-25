sudo useradd -m MasterH
sudo useradd -m Hertz
sudo useradd -m Holland
sudo useradd -m Heisenberg
for i in {1..20};do sudo useradd -m Heisenberg_Intern$i;done
for i in {1..20};do sudo useradd -m Hertz_Intern$i;done
for i in {1..20};do sudo useradd -m Holland_Intern$i;done
for i in {1..20};do sudo chmod -R g=rwx /home/Heisenberg_Intern$i;done
for i in {1..20};do sudo chmod -R g=rwx /home/Hertz_Intern$i;done
for i in {1..20};do sudo chmod -R g=rwx /home/Holland_Intern$i;done
for i in {1..20};do sudo usermod -a -G Heisenberg_Intern$i Heisenberg;done
for i in {1..20};do sudo usermod -a -G Hertz_Intern$i Hertz;done
for i in {1..20};do sudo usermod -a -G Holland_Intern$i Holland;done
sudo usermod -a -G Hertz,Holland,Heisenberg MasterH
for i in {1..5};do sudo mkdir /home/Heisenberg/task$i;done
for i in {1..5};do sudo mkdir /home/Holland/task$i;done
for i in {1..5};do sudo mkdir /home/Hertz/task$i;done
for i in {1..20};do for j in {1..5} ;do sudo mkdir /home/Heisenberg_Intern$i/task$j;done;done
for i in {1..20};do for j in {1..5} ;do sudo mkdir /home/Hertz_Intern$i/task$j;done;done
for i in {1..20};do for j in {1..5} ;do sudo mkdir /home/Holland_Intern$i/task$j;done;done
for i in {1..5};do  for j in {1..50};do sudo touch /home/Heisenberg/task$i/Heisenberg_task$j.txt;done;done 
for i in {1..5};do  for j in {1..50};do sudo touch /home/Holland/task$i/Holland_task$j.txt;done;done 
for i in {1..5};do  for j in {1..50};do sudo touch /home/Hertz/task$i/Hertz_task$j.txt;done;done 
for i in {1..5};do  for j in {1..50};do sudo apg -a 1 -m 128 -x 128 -n 1 >/home/Heisenberg/task$i/Heisenberg_task$j.txt;done;done 
for i in {1..5};do  for j in {1..50};do sudo apg -a 1 -m 128 -x 128 -n 1 >/home/Holland/task$i/Holland_task$j.txt;done;done 
for i in {1..5};do  for j in {1..50};do sudo apg -a 1 -m 128 -x 128 -n 1 >/home/Hertz/task$i/Hertz_task$j.txt;done;done 

sudo touch crontab.txt

echo "0 0 * * * for i in {1..5};do var=$(((RANDOM %50) +1)) ;cat /home/Heisenberg_task$var >/home/Heisenberg_Intern$i/task$i;done
for i in {1..5};do var=$(((RANDOM %50) +1)) ;cat /home/Hertz_task$var >>/home/Hertz_Intern$i/task$i;done
for i in {1..5};do var=$(((RANDOM %50) +1)) ;cat /home/Holland_task$var >>/home/Holland_Intern$i/task$i;done" >crontab.txt
sudo crontab crontab.txt
for i in {1..20};do sudo touch /home/Heisenberg_Intern$i/success.txt /home/Heisenberg_Intern$i/failure.txt;done
for i in {1..20};do sudo touch /home/Holland_Intern$i/success.txt /home/Holland_Intern$i/failure.txt;done
for i in {1..20};do sudo touch /home/Hertz_Intern$i/success.txt /home/Hertz_Intern$i/failure.txt;done
sudo touch /home/Heisenberg/success.txt /home/Heisenberg/failure.txt
sudo touch /home/Hertz/success.txt /home/Hertz/failure.txt
sudo touch/home/Holland/success.txt /home/Holland/failure.txt 
for i in {1..20}; 
 grep -i "Holland-Intern$i ->" logs.txt >>/home/Holland_Intern$i/failure.txt
 grep -i "Heisenberg-Intern$i ->" logs.txt >>/home/Heisenberg_Intern$i/failure.txt
 grep -i "Hertz-Intern$i ->" logs.txt >>/home/Hertz_Intern$i/failure.txt
 grep -i "Heisenberg -> Heisenberg-Intern$i" logs.txt >>/home/Heisenberg/success.txt
 grep -i "Holland -> Holland-Intern$i " logs.txt >>/home/Holland/success.txt
 grep -i "Hertz -> Hertz-Intern$i" logs.txt >>/home/Hertz/success.txt
 grep -i "MasterH ->" logs.txt >>/home/MasterH/success.txt
 grep -i "-> MasterH" logs.txt >>/home/Heisenberg/failure.txt /home/Hertz/failure.txt /home/Holland/failure.txt
 grep -i "Heisenberg ->Hertz" logs.txt >>/home/Heisenberg/failure.txt
 grwp -i "Hertz -> Heisenberg" logs.txt >>/home/Heisenberg/failure.txt
 grep -i "Hertz -> Holland" logs.txt >>/home/Hertz/failure.txt
 grep -i "Holland -> Hertz" logs.txt >>/home/Holland/failure.txt
 grep -i "Heisenberg -> Holland" logs.txt >>/home/Heisenberg/failure.txt
 grep -i "Holland -> Heisenberg" logs.txt >>/home/Holland/failure.txt
 grep -i "Heisenberg -> Hertz-Intern$i" logs.txt >>home/Heisenberg/failure.txt
 grep -i "Heisenberg -> Holland-Intern$i" logs.txt >>home/Heisenberg/failure.txt
 grep -i "Hertz -> Heisenberg-Intern$i" logs.txt >>/home/Hertz/failure.txt
 grep -i "Hertz -> Holland-Intern$i" logs.txt >>/home/Hertz/failure.txt
 grep -i "Holland -> Heisenberg-Intern$i" logs.txt >>/home/Holland/failure.txt
 grep -i "Holland -> Hertz-Intern$i" logs.txt >>/home/Holland/failure.txt
done
awk '/-> Heisenberg-Intern/{print $1, $2 }' logs.txt
awk '/-> Hertz-Intern/{print $1, $2 }' logs.txt
awk '/-> Holland-Intern/{print $1, $2 }' logs.txt 



