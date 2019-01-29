### Environment Setup
Follow the below steps to get your environment setup.

1. Download and Install Install [Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/) by following the instructions.
2. Once it is installed you will need to navigate to `Docker > Preferences > File Sharing`. Then add `/sites/` to the list of directories. It should look like the below.
3. Clone the repo
4. Run docker-compose


### How to

docker-compose run ycharts_wkhtmltopdf wkhtmltopdf --page-size Letter "`ipconfig getifaddr en0`:8000/screener/company/redesign/" /sites/ycharts_pdf_tester/output_pdfs/`date +%F%T`.pdf

docker-compose run ycharts_wkhtmltopdf wkhtmltopdf --page-size Letter "/sites/ycharts_pdf_tester/input_html/test.html" /sites/ycharts_pdf_tester/output_pdfs/`date +%F%T`.pdf