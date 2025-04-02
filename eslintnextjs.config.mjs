import stylistic from "@stylistic/eslint-plugin"
import path from "node:path"
import { fileURLToPath } from "node:url"
import js from "@eslint/js"
import { FlatCompat } from "@eslint/eslintrc"

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)
const compat = new FlatCompat({
    baseDirectory: __dirname,
    recommendedConfig: js.configs.recommended,
    allConfig: js.configs.all,
})

const config = [
    ...compat.extends("next/core-web-vitals"),
    ...compat.extends("next/typescript"), {
        plugins: {
            "@stylistic": stylistic,
        },

        rules: {
            "@stylistic/indent": ["error", 4, {
                SwitchCase: 1,
            }],

            "@stylistic/indent-binary-ops": ["error", 4],
            "@stylistic/linebreak-style": ["error", "unix"],

            "@stylistic/brace-style": ["error", "1tbs", {
                allowSingleLine: true,
            }],

            "@stylistic/quotes": ["error", "double"],
            "@stylistic/semi": ["error", "never"],
            "@stylistic/comma-dangle": ["error", "always-multiline"],

            "@stylistic/member-delimiter-style": ["error", {
                multiline: {
                    delimiter: "none",
                    requireLast: true,
                },

                singleline: {
                    delimiter: "comma",
                    requireLast: false,
                },

                multilineDetection: "brackets",
            }],

            "@stylistic/max-statements-per-line": ["error", {
                max: 2,
            }],

            "curly": ["error", "all"],

            "eqeqeq": ["error", "always"],
        },
    }]

export default config