# Project test-solitics-v3

## Overview

This document summarizes the challenges faced while working on the Terraform infrastructure setup for a multi-region AWS environment, including Kubernetes configurations. The effort took place over the course of the evening on Saturday, March 16, 2024, from 18:00 onwards, with breaks for rest.

## Work Session Details

- **Date**: Saturday, 16MAR24
- **Time**: Started at 18:00, with intermittent breaks for sleep
- **Activity**: Attempting to resolve Terraform configuration issues

## Encountered Issues

Throughout the session, several issues were encountered primarily related to the Terraform configuration:

1. **Duplicate Blocks**: The Terraform configuration included duplicate `terraform` and `provider` blocks, leading to confusion and unnecessary repetition in the setup.

2. **Undefined Provider Reference**: A warning was generated due to an undefined provider reference when specifying providers within modules. This issue pertained to the assumption Terraform made about the intended provider due to the lack of explicit declaration in the child module.

3. **Duplicate Variable Declarations**: Multiple instances of duplicate variable declarations were found in the `variables.tf` file. Terraform requires variable names to be unique within a module, and this violation caused errors during initialization and planning stages.

4. **Misuse of Variables in Default Values**: An attempt to use variables within default value declarations was found, which is not allowed in Terraform. Terraform variables cannot be utilized within the default values of other variables.

## Conclusion

The primary issue stemmed from incorrectly providing variables and managing provider configurations, compounded by some structural and syntactical oversights in the Terraform files. More debugging and adjustments would require a significant effort, and success is not guaranteed due to the intertwined nature of the encountered issues.

## Next Steps

Considering the complexity and time already invested, the decision has been made to rebuild the project from scratch. Starting anew will allow for a more structured approach, avoiding previous mistakes and ensuring a cleaner, more maintainable infrastructure codebase. The aim is to complete this rebuild within a few hours, leveraging the learnings from this session to avoid similar pitfalls.

## Action Plan

1. **Review and Document**: Briefly review the current codebase to document any configurations or setups that may be reusable or serve as a reference.

2. **Clean Slate**: Begin a new Terraform project setup, carefully structuring the files and declarations to avoid previous issues.

3. **Incremental Development**: Apply changes incrementally, verifying each step with `terraform init`, `validate`, and `plan` to ensure correctness before proceeding.

4. **Documentation**: Maintain detailed documentation alongside the development to capture the setup process and any important decisions or configurations for future reference.