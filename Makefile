

```makefile
all: report.html

report.html: output/national_trend.rds output/regional_boxplot.png output/population_plot.png
	Rscript code/02_render_report.R

output/national_trend.rds: code/01_clean_data.R code/02_summarize_national_trend.R
	Rscript code/01_clean_data.R
	Rscript code/02_summarize_national_trend.R

output/regional_boxplot.png: code/03_summarize_regional_variation.R
	Rscript code/03_summarize_regional_variation.R

output/population_plot.png: code/04_summarize_by_population.R
	Rscript code/04_summarize_by_population.R

clean:
	rm -f output/*.rds output/*.png report.html
