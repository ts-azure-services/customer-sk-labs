# customer-sk-labs
A repo to consolidate artifacts around Semantic Kernel labs. Material sourced from the [Semantic Kernel python
samples](https://github.com/microsoft/semantic-kernel/tree/main/python/samples) and other [independent sources](https://github.com/sphenry/agent_hack).

## Other Notes
- The official PyPI package located [here](https://pypi.org/project/semantic-kernel/).
- Start with the notebooks in [`sk-concepts/`](./sk-concepts/) and then proceed to running the python scripts in [`agent-concepts/`](./agent-concepts/).
- Before running the notebooks or scripts, create an environment file (`.env`) and a virtual environment as per the [`Makefile`](./Makefile) instructions.
	- All make commands are to be run in the root of the repository.
	- Depending upon your python version, you may need to specify the command differently:
	  - For example, `python3` vs. `python` in the make command `create-venv`.
	- Ensure you copy the `.env` file to both folders using `make copy-env-file` and run the respective notebooks & scripts from **within** those folders.
	- To run scripts in the [`agent-concepts/`](./agent-concepts/), execute them by running `python <script name>` while in the virtual environment. 
	  - In the case of the [chainlit script](./agent-concepts/03_agent_with_ui.py) execute by running: `chainlit run 03_agent_with_ui.py` while in the [`agent-concepts/`](./agent-concepts/) directory.
- If specifying the `GLOBAL_LLM_SERVICE` set to either `OpenAI`, `AzureOpenAI`, or `HuggingFace` in your `.env` file. Else, the service will default to `AzureOpenAI`. For this lab, one can leave this empty.
