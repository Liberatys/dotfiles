#!/usr/bin/env zx

const prompts = require('prompts')

const [, , , command] = process.argv;

const allowedCommands = ["c", "list"]

if (!allowedCommands.includes(command)) {
    console.log("Invalid command provided")
    await $`exit 1`
}

const templatePath = await $`realpath $HOME/dotfiles/templates`;

const kinds = await quiet($`ls ${templatePath}`);

const kindQuestion = [{
    type: 'select',
    name: 'kind',
    message: 'What kind of template are you looking for?',
    choices: kinds.stdout.split("\n").map((value) => {
        if(value === "" || value === undefined) {
            return null;
        } else {
            return {
                title: value,
                value: value
            }
        }
    }).filter((value) => value !== null)
}];

const kindResponse = await prompts(kindQuestion);

const kind = kindResponse.kind;

const templates = await quiet($`ls ${templatePath}/${kind}`);

const templateQuestion = [{
    type: 'select',
    name: 'template',
    message: 'What template do you want to transfer?',
    choices: templates.stdout.split("\n").map((value) => {
        if(value === "" || value === undefined) {
            return null;
        } else {
            return {
                title: value,
                value: value
            }
        }
    }).filter((value) => value !== null)
}];

const templateResponse = await prompts(templateQuestion);

const template = templateResponse.template;

let name = await question('Name the template destination: ')

if(template.includes('.')) {
    const extension = template.split(".").pop();
    name = `${name}.${extension}`
}

await $`cp -R ${templatePath}/${kind}/${template} $PWD/${name}`
