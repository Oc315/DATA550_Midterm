all: report.html

report.html: output/national_trend.rds output/regional_dotplot.png output/population_plot.png output/population_group_comparison.png
	Rscript -e "rmarkdown::render('report/report.Rmd', output_file = 'report.html')"

output/national_trend.rds: code/01_clean_data.R code/02_summarize_national_trend.R
	Rscript code/01_clean_data.R
	Rscript code/02_summarize_national_trend.R

output/state_avg.rds: code/03_state_avg.R
	Rscript code/03_state_avg.R

output/top10.rds: code/04_top10.R
	Rscript code/04_top10.R

output/regional_dotplot.png: code/05_state_dotplot.R
	Rscript code/05_state_dotplot.R

output/population_plot.png: code/06_summarize_by_population.R
	Rscript code/06_summarize_by_population.R

output/population_group_comparison.png: code/07_compare_population_groups.R
	Rscript code/07_compare_population_groups.R

clean:
	rm -f output/*.rds output/*.png report.html

