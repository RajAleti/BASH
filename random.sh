1.	# Run the system health check for my-project every 15 minutes.
2.	# Replace /path/to/your/repo with the actual path.
3.	*/15 * * * * /path/to/your/repo/scripts/health_check.sh >> $HOME/logs/health_checks_cron.log 2>&1
