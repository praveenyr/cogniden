# Cogniden

![](https://github.com/praveenyr/praveenyr.github.io/tree/master/img/cogniden-main.png }})

## _Explanation_

Cogniden enables users to capture a wealth of information,create and distribute the information to the whole wide world in the form of _wikis_.Users can also share their _wikis_ publicly or privately with other collaborators.
>Indeed, the purpose of an encyclopedia is to collect knowledge disseminated around the globe; to set forth its general system to the men with whom we live, and transmit it to those who will come after us, so that the work of preceding centuries will not become useless to the centuries to come; and so that our offspring, becoming better instructed, will at the same time become more virtuous and happy, and that we should not die without having rendered a service to the human race
—***Diderot***

Cogniden has been built with the Ruby on Rails(5.0) web development framework.


## _User Stories_

Cogniden app, the following user stories have been implemented -

1. Users need to sign up for Cogniden.
2. Users need to sign in and out of Cogniden.
3. Users need to _create_, _read_, _update_, and _delete_ public wikis
4. Users need to be assigned roles - **admin**,**standard** or **premium**.
5. Users can upgrade their account from a free to a payment plan.
6. Users can edit wikis using _Markdown_ syntax.
7. Users can **add** and **remove** collaborator for private wikis.

## _Solutions_

#### User Authentication : 
For Authentication,I have used the _Devise_ gem which is a flexible authentication model based on _Warden_.Devise comes with a vareity of modules to pick and choose from.I've used the following modules in Cogniden- database_authenticatable, registerable, confirmable, recoverable, rememberable, recoverable, trackable, validatable.You can checkout Devise's [wiki](https://github.com/plataformatec/devise/wiki "devise wiki") for more information on the modules and how to use devise.

#### User Authorization : 
The user authorization for Cogniden has been implemented using the _Pundit_ gem._Pundit_ is an easy and flexible authorization gem where the entire authorization logic is based on "policy classes" which are nothing but plain old Ruby classes.More information about the Pundit gem can be found [here](http://www.rubydoc.info/gems/pundit "pundit gem")

#### User Roles : 
Once we've set up authentication and authorization,the next logical step would be to assign specific _roles_ to users.And thats when my awesome mentor suggested I use *_rolify_* - a simple easy to use gem which integrates very well with devise.You can read more about rolify [here](https://github.com/RolifyCommunity/rolify "rolify github")

#### Upgrading an Account : 
Cogniden needs to be able to provide users with the ability to upgrade their default _free plan_ to a _premium_ one and downgrade from _premium_ to a _free_. Enter ("https://stripe.com/" "Stripe").Stripe is a flexible online payment system which allows individuals and businesses to integrate payments into their websites.For information on how to setup your Rails controller and views with Stripe,see [here](https://stripe.com/docs "stripe").Stripe also provides some test credit card numbers(ex - **4242 4242 4242 4242**) to test and validate your payments.

#### Use Markdown syntax : 
[Redcarpet](https://github.com/vmg/redcarpet "Redcarpet") is a Ruby library for Markdown processing and is really easy to use.The core of the Redcarpet library is the _Redcarpet::Markdown_ class. Each instance of the class is attached to a Renderer object; the Markdown class performs parsing of a document and uses the attached renderer to generate output.

#### Wiki Collaboration : 
A user needs to collaborate with other users on private wikis,and I modeled this using Rails' _Active Record Associations_.Since a wiki can have many collaborator,I've used the *has_many* and *belongs_to* associations.
    
    ```
    class Wiki < ApplicationRecord
        belongs_to :user
        has_many :collaborators, dependent: :destroy
        ...
    end

    class Collaborator < ApplicationRecord
        belongs_to :wiki
        belongs_to :user`
        ...
    end
    
    ```
    

Detailed guide to Active Record Associations is available (http://guides.rubyonrails.org/association_basics.html#has-many-association-reference "here").

## _Results_

The screenshots below depicts the various user stories for Cogniden and the grandual progression of user stories from Authentication,Authorization,user upgrade,wiki creation using _Markdown_ synatx and lastly,user collaboration.

#### Authentication
--------------------
* **User Sign up ,Sign up confirmation and Sign in**.
A new user signs up with email and password, confirms his email and is then redirected to the sign in page.

![sign up](/img/signup.png "Sign Up")

![sign up conf](/img/signupconfirmation.png "Sign Up Confirmation")

![sign in](/img/signin.png "Sign Up Confirmation")

#### User upgrade
------------------
* A user is assigned a standard role by default.To create private _wikis_,he can upgrade to _premium_.This is illustrated with stripe payment using the below screenshots.

![upgrade user](/img/upgradeuser.png "Upgrade User")

![pay with card](/img/paywithcard.png "Pay With Card")

![CC details](/img/stripepayment.png "CC details")

![premium user](/img/premiumuser.png "Premium User")

#### Markdown
------------------
* Create a _wiki_ using Markdown syntax

![create wiki](/img/markdownsyntax.png "create wiki")

![show wiki](/img/markdownsyntax_confirmation.png "show wiki")

#### Collaboration
------------------
* Add a collaborator to a private wiki,then login as collaborator and edit the wiki

![add collaborator](/img/addcollaborator.png "add collaborator")

![show collaborator](/img/collaboratoradded.png "show collaborator")

![edit as collaborator](/img/collaboratoredited.png "edit as collaborator")

![show collaborator edits](/img/showeditsforcollaborator.png "show collaborator edits")

