package cmd

import (
	"bufio"
	"fmt"
	"github.com/Seann-Moser/CaseConvert/pkg/caseConvert"
	"github.com/spf13/cobra"
	"github.com/spf13/pflag"
	"github.com/spf13/viper"
	"os"
	"strings"
)

// convCmd represents the conv command
var convCmd = &cobra.Command{
	Use:   "conv",
	Short: "convert any string case type",
	RunE:  Convert,
}

func ConvFlags() *pflag.FlagSet {
	fs := pflag.NewFlagSet("conv", pflag.ExitOnError)
	fs.StringP("input", "i", "", "")
	fs.BoolP("snake", "s", false, "")
	fs.BoolP("camel", "c", false, "")
	fs.BoolP("pascal", "p", false, "")
	fs.BoolP("kebab", "k", false, "")
	fs.BoolP("env", "e", false, "")
	fs.String("case", "", "")
	return fs
}

func init() {
	convCmd.Flags().AddFlagSet(ConvFlags())
	rootCmd.AddCommand(convCmd)
}

func Convert(cmd *cobra.Command, args []string) error {
	var convertStrings []string

	if len(viper.GetString("input")) != 0 {
		convertStrings = append(convertStrings, viper.GetString("input"))
	} else {
		reader := bufio.NewReader(os.Stdin)
		stdin, err := reader.ReadString('\n')
		if err != nil {
			return fmt.Errorf("input is required(--input or stdin)")
		}
		convertStrings = strings.Split(string(stdin), "\n")
	}
	c := caseConvert.EnvironmentCase
	if viper.GetBool("snake") {
		c = caseConvert.SnakeCase
	} else if viper.GetBool("camel") {
		c = caseConvert.CamelCase
	} else if viper.GetBool("pascal") {
		c = caseConvert.PascalCase
	} else if viper.GetBool("kebab") {
		c = caseConvert.KebabCase
	} else if viper.GetBool("env") {
		c = caseConvert.EnvironmentCase
	}
	caseType := viper.GetString("case")
	if caseType != "" {
		c = caseConvert.CaseType(caseType)
	}
	for _, input := range convertStrings {
		if len(input) == 0 {
			continue
		}
		d, err := caseConvert.Convert(strings.ReplaceAll(input, "\n", ""), c)
		if err != nil {
			return err
		}
		fmt.Println(d)
	}
	return nil
}
