# Sonic-Pi Samples Datasette

This is an experiment with online audio samples.  
We are using [Datasette](https://datasette.io/) to visualize and explore the samples that come with the [Sonic-Pi](https://sonic-pi.net/) project.

## Interface

<img src="../assets/sonic-pi-samples-1.png" width="400" alt="Screenshot of the Datasette showing a list of samples in waveform players">

## Waveform Player

<img src="../assets/sonic-pi-samples-2.png" width="400" alt="Screenshot of the waveform player in fullscreen mode">

# Setup

**Note:**  

If you don't want to mess with Sonic-Pi, you can skip steps 1 to 3 and just use the prebuilt sqlite database included in this repo.

## 1. Install Sonic-Pi

Install Sonic-Pi on your System.

## 2. Create a CSV-File of Samples

We are utilising a little Sonic-Pi Program (written in Ruby) to list all the samples and their properties and write them to a CSV file. 

- start Sonic-Pi
- load `save-samples-csv.rb` 
- you may need to adjust the path of the output file in line 20
- run the script
- the output file should be saved to the current folder.

## 3. Create the SQLite database

Make sure you have [sqlite-utils](https://sqlite-utils.datasette.io/en/stable/) installed, then:

```sh
sqlite-utils insert sonicpi.db samples samples.csv --csv --detect-types --pk sample
```

## 4. Plugins

This experiments uses the following datasette plugins:

- **datasette-darkmode** (recommended)  
  *to show the datasette in darkmode (including the sql editor)*
- **datasette-audio-waveform**  
  *to show the audio files in a waveform audio player*

Install them using `datasette install`

## 5. Settings

Since the waveform audio player currently preloads all samples on a page, we limit the number of requests via the settings.

Settings are configured in 
- `settings.json` for Datasette 0.x
- `datasette.yaml` for Datasette 1.x

Important Settings are:
- `default_page_size: 10`
- `max_returned_rows: 12`

## 6. Start Datasette

Run the start script in this directory

```sh
./start.sh
```









