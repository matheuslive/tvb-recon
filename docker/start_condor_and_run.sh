#$(condor_config_val MASTER) -f -t >> /var/log/condor/MasterLog 2>&1
echo "123456" | sudo -S condor_master >> /dev/null 2>&1
sleep 5

pegasus-service -H 0.0.0.0 -p 5000 &> /dev/null &

cd pegasus
python run_sequentially.py $1