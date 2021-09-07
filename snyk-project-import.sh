name: "Snyk Project Import"
# Run workflow each time code is pushed to your repository. 
on: push
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2   
      - name: Snyk Branch Import
        run:  sh ./snyk-project-import.sh
        env:
            WORKSPACE: ${{ github.workspace }}
            OWNER: ${{ github.repository_owner }}
            REPOSITORY: ${{ github.event.repository.name }}
            BRANCH_NAME: ${GITHUB_REF##*/}
            SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}
            SNYK_ORG: ${{ secrets.SNYK_ORG }}
            SNYK_INTEGRATION_ID: ${{ secrets.SNYK_INTEGRATION_ID }}
