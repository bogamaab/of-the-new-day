# frozen_string_literal: true

module Users::SessionFormService
  include FormService

  ATTRIBUTES = %i[identification_number password]

  TYPES_OF_ATTRIBUTES = { identification_number: :string, password: :password }

  LABEL_CLASSES = {
    identification_number: 'text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70',
    password: 'text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70'
  }

  INPUT_CLASSES = {
    identification_number: 'flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50',
    password: 'flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50'
  }

  LABEL_TRANSLATION = nil # 'users.sessions.new.form.fields'

  PLACEHOLDER_TRANSLATION = nil # 'users.sessions.new.form.placeholders'
end