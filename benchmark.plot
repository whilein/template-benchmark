# Labels
set title 'Java Template Engine Performance Comparison'
set ylabel 'Templates rendered per second'
set xlabel 'Template Engine'
set xtics nomirror rotate by -45

# Ranges
set autoscale

# Input
set datafile separator ','

# Output
set terminal pngcairo enhanced font "Verdana,9"
set output 'results.png'
set grid
set key off
set boxwidth 0.8 relative

# box style
set style line 1 lc rgb '#AC91CD' lt 1
set style fill solid

# remove top and right borders
set style line 2 lc rgb '#808080' lt 1
set border 3 back ls 2
set tics nomirror


plot 'results.csv' every ::1 using 0:5:xticlabels(substr(strcol(1), 31, int(strlen(strcol(1))) - 10)) with boxes ls 1,\
    'results.csv' every ::1 using 0:($5 + 5000):(sprintf("%dk",$5/1000)) with labels
