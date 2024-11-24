{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    python310
    (python311.withPackages(
      ps: with ps; [
        # Linting and Testing
        ruff
        black
        mypy
        pre-commit
        pytest
        coverage

        pytest-mock
        pytest-subtests
        pytest-cov
        pytest-env

        freezegun
        pyfakefs
        moto

        pandas-stubs
        types-pyyaml
        types-freezegun
        types-requests
        types-python-dateutil
        types-pytz
        types-beautifulsoup4

        # Development
        boto3-stubs
        beautifulsoup4
        botocore
        awswrangler
        boto3
        scipy
        pandas
        psutil
        openpyxl
        aiohttp

        click
        nameparser
        pymupdf
        pycountry
        python-dateutil
        rapidfuzz
        requests
        retry
        tenacity
        tqdm
        XlsxWriter
        unidecode
        setuptools
        marshmallow
        pyyaml
        dataclasses-json
        numpy
        GitPython
        pyarrow
        smart-open

        pydantic
        nltk
        networkx
        pathos
        scikit-learn
        langchain
        langchain-core
      ]
     )
    )
    python312
    erlang_27
    elixir
    slack
    gofumpt
    go
  ];
}
