### About
The following project is an example of running `wkhtmltopdf` locally to generate PDF reports.
If you want to read more about `wkhtmltopdf` the documentation is available at [wkhtmltopdf.org](https://wkhtmltopdf.org/usage/wkhtmltopdf.txt) and the github repo is [`wkhtmltopdf/wkhtmltopdf`](https://github.com/wkhtmltopdf/wkhtmltopdf).

-----------------

### Environment Setup
Follow the below steps to get your environment setup.

1. Download and Install Install [Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/) by following the instructions.
1. Clone the repo in your home directory by running the following commands:
```
cd ~
git clone git@github.com:KFoxder/ycharts_pdf_generator.git
 ```

-----------------

### How to run

Once you have run the Environment Setup. We can run `wkhtmltopdf`. There are 2 main ways you will want to run `wkhtmltopdf`.

##### 1. Static HTML file
One way to run `wkhtmltopdf` is using a static HTML file with markup and styling. The below command will render the example HTML file included as a PDF.
```
cd ~/ycharts_pdf_generator
docker-compose run ycharts_pdf_generator wkhtmltopdf --dpi 300 --page-size Letter "/tmp/ycharts_pdf_generator/input_html/test.html" /tmp/ycharts_pdf_generator/output_pdfs/`date +%F%T`.pdf
```
After running the above command you should see a PDF file in the `~/ycharts_pdf_generator/output_pdfs` directory.

##### 2. URL
The second way to run `wkhtmltopdf` is using a URL.

The below example assumes you are running a local development server on `localhost`. If you want to generate a PDF from the URL `localhost:8080/fs.html` you would run the below command.
```
cd ~/ycharts_pdf_generator
docker-compose run ycharts_pdf_generator wkhtmltopdf --dpi 300 --page-size Letter "`ipconfig getifaddr en0`:8080/fs.html" /tmp/ycharts_pdf_generator/output_pdfs/`date +%F%T`.pdf
```

If you want to generate a PDF from a public URL (ie. `https://www.google.com/`) you can use the following command.
```
cd ~/ycharts_pdf_generator
docker-compose run ycharts_pdf_generator wkhtmltopdf --dpi 300 --page-size Letter "https://www.google.com/" /tmp/ycharts_pdf_generator/output_pdfs/`date +%F%T`.pdf
```

-----------------

### Important Notes

You will notice that `wkhtmltopdf` will display CSS slightly different than the browser which is expected. Under the hood it uses the Qt Webkit engine.

