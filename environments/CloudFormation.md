- We provision three stacks: demo-pre-requisites, demo-spot-fleet, demo-test-runner in this order
- Copy the parameters.json.example file for each stack to parameters.json and customise the same for your needs 
- Cross-stack references are used and resource names exported from demo-pre-requisites and demo-spot-fleet stacks
- The stacks for spot-fleet and test-runner are created or updated as part of the pipeline, and are deleted once the test run is complete, and test results are obtained